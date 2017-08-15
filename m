From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Aug 2017 10:39:48 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
In-Reply-To: <CAB0FRsuYHMSgoMqpkyq2ieQL54hh6EVywUTv=jBAqdgNZcZdWw@mail.gmail.com>
References: <20170813133111.3959-1-francois.perrad@gadz.org>
 <20170814222528.1ca21238@windsurf>
 <CAB0FRsuYHMSgoMqpkyq2ieQL54hh6EVywUTv=jBAqdgNZcZdWw@mail.gmail.com>
Message-ID: <20170815103948.5e910211@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 08:14:19 +0200, Fran?ois Perrad wrote:

> The issue that we try to fix, was introduced 5 days ago, by the commit
> [lua: fix pkg-config file](
> https://git.busybox.net/buildroot/commit/package/lua?id=8d845683e37640d33c186c0091ccce6ae3ef0777
> )
> 
> My patch restore the previous install commands.
> If the lua.pc must be modified with configuration data, the logical step
> for this is the configure step.
> 
> Your patch is the little one which fixes the issue, but it doesn't see the
> root cause.

Well, whether SED'ing those .pc files should be part of the configure
step or the install step can really be discussed. If those .pc files
were used for the build process, then indeed, generating them should be
part of the configure step. But as far as I know, they are not used
during the build step. Those .pc files are only used for other packages
who want to link against lua. Therefore, generating them/installing
them in the install step is quite OK I believe, but I agree it's a
matter of definition of what each step should do, so there might be
different views/opinions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
