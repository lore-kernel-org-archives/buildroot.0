From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Mar 2016 15:51:01 +0200
Subject: [Buildroot] [PATCH v1] qt5tools: disable qdoc (needs
 qtdeclarative)
In-Reply-To: <20160329145543.45f90da8@free-electrons.com>
References: <1459251925-31678-1-git-send-email-ps.report@gmx.net>
 <20160329145543.45f90da8@free-electrons.com>
Message-ID: <20160329155101.6517e0aa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 29 Mar 2016 14:55:43 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 29 Mar 2016 13:45:25 +0200, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   Project ERROR: Unknown module(s) in QT: qmldevtools-private
> >   Makefile:63: recipe for target 'sub-qdoc-qmake_all' failed
> > 
> > [1] http://autobuild.buildroot.net/results/b0a/b0a5641beae14ff79a9d5a628bb41957826eb623
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Thanks, I've applied to fix the build issue, but I would really prefer
> a solution that is acceptable upstream. If I remember correctly, you
> can do some conditionals in .pro files like "if qtdeclarative is
> available, then do this". This way, you could build qdoc if
> qtdeclarative is available, and not build it otherwise.
> 
> What do you think?

Will try to submit the conditional compile solution upstream (but not sure
if the preferred upstream solution would be qdoc without qml support as done
for the linguist/lupdate tool)...

Regards,
Peter

> 
> Thomas
