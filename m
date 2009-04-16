From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Apr 2009 19:59:39 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <20090416091027.6c6153fe@surf> (Thomas Petazzoni's message of
	"Thu\, 16 Apr 2009 09\:10\:27 +0200")
References: <20090414103327.2fd69516@danhplaptop>
	<87eivtx0c4.fsf@macbook.be.48ers.dk> <20090416091027.6c6153fe@surf>
Message-ID: <87ocuwa390.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> make distclean.

 Thomas> Which is quite confusing since :

 Thomas> $ make help | grep distclean
 Thomas>   distclean              - delete all non-source files (including .config)

 Thomas>  :-)

I agree. The clean targets are quite a mess (especially when
considering the project stuff).

I think we should probably just have clean and distclean (and the
individual <target>-clean / -dirclean stuff), where distclean is
clean + rm .config

-- 
Bye, Peter Korsgaard
