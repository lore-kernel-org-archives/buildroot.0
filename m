From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jan 2014 23:14:45 +0100
Subject: [Buildroot] [PATCH 1/2] packages infra: add function to get a
	Kconfig option
In-Reply-To: <20140126202538.GC1752@free.fr> (Yann E. MORIN's message of "Sun, 
 26 Jan 2014 21:25:38 +0100")
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <b68b4ce8c5017701344c6f32a993de7d3e26802b.1390744549.git.yann.morin.1998@free.fr>
 <87wqhm1pg3.fsf@dell.be.48ers.dk> <20140126202538.GC1752@free.fr>
Message-ID: <87y522z8yy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Should this perhaps use $(SED)?

 > $(SED) is 'sed -i -e'

 > And we don't want to replace in-place!

 > BTW, that $(SED) is 'sed -i -e' is really bugging me everytime I need
 > to use sed.

 > I thionk we should introduce:
 >   SED := sed -e
 >   SEDI := sed -i -e

 > We unfortunately have that many calls to $(SED) here and there... We'd
 > need to audit and replace all of them.

Hmm, yes - Agreed (even though I don't think we really need a SEDI). I
don't really know why we added -i to SED, but I agree that it isn't
really nice (it dates back to the 2d523c23 mega commit).


 >> Sorry, I'm probably missing something, but I don't right away see why we
 >> don't just use:
 >> 
 >> $(SED) -n 's/^$(1)=//p' $(2)

 > Oh, I just copied and adapted the commands in the lines above, from
 > KCONFIG_SET_OPT or KCONFIG_ENABLE_OPT.

Ahh, ok - Then I prefer the simple variant then - I believe it behaves
identical but is directly obvious (to me).

-- 
Bye, Peter Korsgaard
