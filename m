From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Apr 2017 10:05:38 +0200
Subject: [Buildroot] [PATCH] syslog-ng: use bundled libbson
In-Reply-To: <20170421034032.bxgpf4xxsejwof3j@tarshish>
References: <cb65ed7b607b680814b733781dbb884fa78471f1.1492684628.git.baruch@tkos.co.il>
 <20170420221955.7bc076c8@free-electrons.com>
 <20170421034032.bxgpf4xxsejwof3j@tarshish>
Message-ID: <20170421100538.41bbc9fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 06:40:32 +0300, Baruch Siach wrote:

> > Thanks for the patch. However, wouldn't it make more sense to disable
> > the mongo-c-driver of syslog-ng completely, until someone packages the
> > appropriate dependencies?  
> 
> The bundled mongo-c-driver and libbson seem to build fine with syslog-ng. It's 
> only the recent introduction of libbson in Buildroot that broke the build. So 
> the only drawback of forcing the bundled libbson is the loss of possible size 
> reduction opportunity. As I noted in the commit log, anyone worried about that 
> should package mongo-c-driver. But I don't think this is a reason to disable 
> the mongodb module.

Well, our policy is normally to avoid using bundled libraries. So if
syslog-ng needs a dependency that isn't packaged in Buildroot, then
this syslog-ng feature should be disabled rather than using bundled
libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
