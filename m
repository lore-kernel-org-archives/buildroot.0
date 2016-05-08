From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 14:39:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <CABa6e=og-BDA_VY=wJ17uc9=-S0D34SEstRv1W_FyFVUU=ehcw@mail.gmail.com>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <20160507144313.4e7112af@free-electrons.com>
 <20160507184514.GA2419@tarshish>
 <20160507214016.5592aea2@free-electrons.com>
 <CABa6e=og-BDA_VY=wJ17uc9=-S0D34SEstRv1W_FyFVUU=ehcw@mail.gmail.com>
Message-ID: <20160508143956.4b5a4db0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 May 2016 06:55:36 +1000, Cam Hutchison wrote:

> > As far as I understand, we can't use go 1.5.2 as the bootstrap
> > compiler, because since 1.5.x, Go is written in Go. I guess we will
> > have to backport the patch.  
> 
> I think it should be sufficient to build the go-bootstrap compiler with
> "CGO_ENABLED=0" in its environment. This worked for me when I
> played with it and looks like the correct solution according to
> https://github.com/golang/go/issues/13114

When the packaging of Go was added to Buildroot, I was pointed to
https://docs.google.com/document/d/1OaatvGhEAq7VseQ9kkavxKNAfepWy2yhPUBs96FGV28/edit,
which says that using Go 1.4 as the bootstrap compiler to build Go 1.5
was the proper solution.

Now, if it is possible to use a two-stage build of go 1.5, then that's
also fine with me, but it somewhat contradicts the above document.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
