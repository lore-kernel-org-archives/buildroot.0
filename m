From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 27 Sep 2011 10:56:46 +0200
Subject: [Buildroot] [PATCH] linux custom tarball: automatically detect
 a change in tarball configuration
In-Reply-To: <20110922215817.1bba4c82@skate>
References: <7ee0d57e0b0bbf8917e2.1316595354@localhost6.localdomain6>
 <20110922215817.1bba4c82@skate>
Message-ID: <CAHQn0kigOduyrNFO6kxyOVCoJC99V7m+yqmh2YsXsmD85i=mGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 22, 2011 at 9:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 21 Sep 2011 10:55:54 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> When you specify a LINUX_TARBALL, the variable LINUX_VERSION will be set to
>> the fixed "custom". As a result, LINUX_DIR remains the same even though you
>> modified the .config file to specify a different tarball. ?When re-running
>> make, buildroot does not see the change because the stamp files still look
>> up-to-date, and you'll have to force building the new kernel in some way.
>>
>> This patch overwrites LINUX_VERSION to include the LINUX_TARBALL string, If a
>> new custom tarball is configured, LINUX_DIR will be different, the old stamp
>> files will not matter, and buildroot will correctly start the build process for
>> the new kernel.
>
> Sorry, but LINUX_TARBALL can be something like
> http://foobar.com/blah/blek/linux-3.11.0.tar.bz2, and I don't think
> it's a good idea to create a directory named
> linux-custom-http://foobar.com/blah/blek/linux-3.11.0.tar.bz2

$ echo "http://foobar.com/blah/blek/linux-3.11.0.tar.bz2" | sed -e
's|^[a-z]*://||;s|[/]|_|g'
foobar.com_blah_blek_linux-3.11.0.tar.bz2

How would "output/build/linux-foobar.com_blah_blek_linux-3.11.0.tar.bz2/" work?
