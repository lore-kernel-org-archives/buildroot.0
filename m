From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 12:05:48 +0200
Subject: [Buildroot] [PATCH v2] pacakge/qt5/qt5base: fix build with
 ccache
In-Reply-To: <55E031B7.20308@wsystem.com>
References: <1440755211-46875-1-git-send-email-benoit@wsystem.com>
 <20150828115749.6e4b4481@free-electrons.com>
 <55E031B7.20308@wsystem.com>
Message-ID: <20150828120548.596ee91c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri, 28 Aug 2015 12:02:31 +0200, Beno?t Th?baudeau wrote:

> > Then wouldn't it make more sense to use the last() function, to use the
> > last value rather than the first, and actual check the compiler rather
> > than ccache?
> > 
> > 	compiler = $$last(QMAKE_CXX)$$sfx
> 
> The last() function could be less portable because there might be some other use
> cases out there that we're not thinking about. On the contrary, we're certain
> that the first value has to be an executable.

Correct. It makes the test a bit useless though. But oh well that test
is not very useful in the first place. If upstream is happy with a
$$first() solution, I'm fine :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
