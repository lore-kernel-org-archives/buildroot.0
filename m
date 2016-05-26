From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 22:01:08 +0200
Subject: [Buildroot] [PATCH v3 1/3] runc: new package
In-Reply-To: <1464292309.2374.38.camel@infradead.org>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-2-git-send-email-christian@paral.in>
 <20160526211207.06e27be6@free-electrons.com>
 <1464292309.2374.38.camel@infradead.org>
Message-ID: <20160526220108.337d1590@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 12:51:49 -0700, Geoff Levand wrote:

> Go expects the developer to have a 'workspace' with a
> prescribed directory layout.  Many projects archive their
> sources with a truncated path, so when they are extracted
> to a directory (@D in buildroot's case) things need to be
> fix enough for the go compiler to work.  This is a common
> situation, and these fixups are often seen in project
> build scripts.
> 
> See https://golang.org/doc/code.html#Workspaces

I have no problem with Go requiring a "workspace" to have a certain
organization. But why does these workspaces all need to be in
$$GOPATH ? Why can't $(@D) for each package contain a workspace ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
