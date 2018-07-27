From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:49:30 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql --with-libxml configure
 option added
In-Reply-To: <CAFSsvmqDUkMg4-=pQ94UR2Q7BynejSDT55HMq4WFYYmw4K4kpw@mail.gmail.com>
References: <20180608062231.2345-1-dde@innovaphone.com>
 <F73717A01AEC1F4CB9A3D10E39CBB88F4424CD47@INNO-EX-2010.innovaphone.sifi>
 <F73717A01AEC1F4CB9A3D10E39CBB88F443662EA@INNO-EX-2010.innovaphone.sifi>
 <AD312B93A689234094FC24F3B98DBF33437A1708@INNO-EX-2010.innovaphone.sifi>
 <20180727093114.4943db9a@windsurf>
 <99413edb-b83b-6d16-327b-192bbf4c09be@mind.be>
 <CAFSsvmqDUkMg4-=pQ94UR2Q7BynejSDT55HMq4WFYYmw4K4kpw@mail.gmail.com>
Message-ID: <20180727234930.3a42d30c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Jul 2018 17:39:57 -0400, Adam Duskett wrote:

> Another nitpick I would have is that there should probably be a
> Config.in entry for this as well.

No, probably not. As a general rule in Buildroot, we prefer automatic
handling of optional dependencies, in order to avoid a proliferation of
gazillion of Config.in options. In addition, postgresql.mk already
handles all its optional dependencies this way.

The only reason to not do this in this case would be if the XML2
support in postgresql increases significantly the size of the
postgresql binary.

But again, in general, automatic handling of optional dependencies is
preferred.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
