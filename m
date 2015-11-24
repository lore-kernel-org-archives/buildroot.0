From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 23:05:09 +0100
Subject: [Buildroot] [PATCH 08/51] core/legal-info: allow ignoring
	packages from the legal-info
In-Reply-To: <20151123212649.794b7583@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 23 Nov 2015 21:26:49 +0100")
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <2462093e5e97e8e420b7119ac6ca6078e39f4621.1448289515.git.yann.morin.1998@free.fr>
 <20151123212649.794b7583@free-electrons.com>
Message-ID: <87ziy3yrxm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Peter,
 > Can you give your opinion on the semantic/usage of the
 > <pkg>_REDISTRIBUTE variable.

 > I am personally not a big fan of the non-boolean behavior introduced by
 > this patch for this variable. With this patch, <pkg>_REDISTRIBUTE
 > switches from a normal YES/NO boolean variable to a weird tristate
 > variable YES/IGNORE/NO.

 > I have already stated my opinion that there should be two boolean
 > variables instead:

 >  * One which allows the package to indicate if the package should be
 >    mentioned in the legal-info or not.

 >  * One which allows the package to indicate if the package "source"
 >    should be saved to the legal-info or not. Of course, this variable
 >    is ignored if the first one is set to "NO".

 > This is IMO a lot clearer than a single variable with the YES/IGNORE/NO
 > values.

 > Peter ?

I thought I had already replied to this, but perhaps that was only on
IRC? In general, I feel that the legal-info is purely an aid that can
serve as input to whatever license compliancy effort the user has to do
- E.G. include the various license texts in the user manual, provide
source offer and so on, so if the data contains a bit of extra
information that isn't such a big deal.

But ok, if we want to do it I would atleast want it to be as simple and
easy to use as possible. I agree with Thomas that splitting the two
things we want to do into two seperate variables is probably the easiest
to understand.

-- 
Venlig hilsen,
Peter Korsgaard 
