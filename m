From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 09:31:15 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: use = instead of := and
 re-indent
In-Reply-To: <201107050008.38502.yann.morin.1998@anciens.enib.fr>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <b98e01894aa9475d1480f8c2337190caf1281b7e.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107050008.38502.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110705093115.0d35dcb6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 5 Jul 2011 00:08:38 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> What is the rationale for using '=' instead of ':='?

Consistency. And also because personally, I find = nicer to read
than :=, but as you state below, it's true that the behaviour is not
the same.

> Using '=' evaluates the assignemnt every time it is referenced, which
> can be a little bit costly when there are tons of them (like in
> buildroot); while using ':=' does the evaluation only once, at the
> time of the assignment, not evaluation.
> 
> I agree that the code should be homogeneous, but I'd think it should
> be fast as well. He, if I can get butter, buter's money, and a litle
> smile from the dairywoman! ;-)

Then, we should state that those variables must all be defined with :=
all over the place and enforce this decision. In the mean time, I will
drop those modifications from my patch set.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
