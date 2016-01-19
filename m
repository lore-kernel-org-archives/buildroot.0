From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 11:31:54 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <87twm93lsb.fsf@dell.be.48ers.dk>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <87y4bn6y5s.fsf@dell.be.48ers.dk>
 <20160118214704.GA3380@free.fr>
 <20160118230345.52b8f054@free-electrons.com>
 <877fj64jhn.fsf@dell.be.48ers.dk>
 <20160118232457.472dc051@free-electrons.com>
 <87y4bm2d42.fsf@dell.be.48ers.dk>
 <20160119111834.797ea6d9@free-electrons.com>
 <87twm93lsb.fsf@dell.be.48ers.dk>
Message-ID: <20160119113154.2f4613fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 19 Jan 2016 11:29:08 +0100, Peter Korsgaard wrote:

> Well, linux-headers doesn't need to do much - So with a bit of care I
> think you can.
> 
> E.G. something like (completely untested):
> 
> ifeq ($(LINUX_HEADERS_FROM_KERNEL),y)
> # no source
> LINUX_HEADERS_SOURCE =
> LINUX_HEADERS_DEPENDENCIES += linux-configure

The configure step of a package depends on the dependencies of that
package. So linux-configure depends on toolchain. And toolchain depends
on linux-headers -> recursive dependency.

Another try ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
