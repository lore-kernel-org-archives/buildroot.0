From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Sep 2019 12:51:35 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libsodium: add config for
 full build
In-Reply-To: <20190929090408.67e6d38e@windsurf>
References: <20190923082902.28472-1-adrien@gallouet.fr>
 <20190928231934.236e5f83@windsurf>
 <CAFtSRGDT0udQCby-XzsZTe-VUTBSva7cdrh6wpZ_nMf+J8Pz2Q@mail.gmail.com>
 <20190929090408.67e6d38e@windsurf>
Message-ID: <91913550-aa51-4b85-225b-e1b674e91e66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/09/2019 09:04, Thomas Petazzoni wrote:
> On Sat, 28 Sep 2019 23:49:56 +0200
> Adrien Gallou?t <adrien@gallouet.fr> wrote:
> 
>>> But then, does it make sense to invert the option and name it
>>> BR2_PACKAGE_LIBSODIUM_MINIMAL ? It would match the
>>> --enable-minimal/--disable-minimal autoconf options of libsodium.  
>>
>> That was my first patch :) Do you want me to resubmit it ?
> 
> I don't have a very clear-cut opinion.
> 
> On one hand, it is weird to have a Config.in option to reduce/remove
> something. But on the other hand, it makes sense to have Config.in
> options that are as much as possible mapped to the corresponding
> options provided by the package build system.
> 
> Arnout, Peter, any preference ?

 It was me who suggested to turn around the logic.

 I believe we have had problems in the past where there was some MINIMAL option,
but then some other package needed something from the non-minimal set. Then it
has to do a 'depends on' instead of a 'select'.

 So it's not a matter of being weird, it's a matter of making sure we don't
create problems in the future.


>> Also, we need to pass --disable-minimal in an "else" clause.

 This is still true. Adrien, I believe I did say something to that effect in an
earlier iteration, and I also believe you replied to it. But my memory is
worthless :-)

 Regards,
 Arnout
