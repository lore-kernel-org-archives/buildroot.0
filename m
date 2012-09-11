From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 11 Sep 2012 10:46:02 -0400
Subject: [Buildroot] [PATCH 1/4] If linux-pam is built,
 enable dbm functionality in Berkeley DB
In-Reply-To: <20120911163208.3e9d23b3@skate>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <20120911163208.3e9d23b3@skate>
Message-ID: <CADiAo4Ly0Tv=bJMewpY=PW9fj4cWNKG-vdwdQwbiySSZ6kRkAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Sep 11, 2012 at 10:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sat,  8 Sep 2012 00:21:03 -0400,
> Dmitry <golubovsky@gmail.com> a ?crit :
>
>> +             $(if $(BR2_PACKAGE_LINUX_PAM),--enable-dbm,--disable-dbm) \
>
> I don't really like this. I think you should rather add a configuration
> sub-option in package/berkeleydb/Config.in to enable/disable DBM
> support, and then have berkeleydb.mk test this configuration option,
> and the linux-pam/Config.in package select it.

Well, adding extra config options is what I really wanted to avoid.
But this may be just my way of thinking.

> I don't like when one package recipe pokes into the configuration
> options of another package.

It is not a problem to add such configuration item, I'll do it.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
