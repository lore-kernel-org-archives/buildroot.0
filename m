From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:32:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: simplify
 step_pkg_size
In-Reply-To: <20200227225556.4f542711@windsurf.home> (Thomas Petazzoni's
 message of "Thu, 27 Feb 2020 22:55:56 +0100")
References: <20200226194345.1087529-1-thomas.petazzoni@bootlin.com>
 <20200226194345.1087529-2-thomas.petazzoni@bootlin.com>
 <87eeuflmwj.fsf@dell.be.48ers.dk>
 <20200227225556.4f542711@windsurf.home>
Message-ID: <875zfrlkzt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 27 Feb 2020 22:51:08 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
 >> 
 >> > Use the same trick in step_pkg_size as the one used in check_bin_arch:
 >> > factorize the two $(filter ...) calls into one, checking in one step
 >> > the step and whether it's the beginning or end of the step.  
 >> 
 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
 >> 
 >> Committed, thanks.

 > Is this something you applied to master?

Yes.

 > Even though PATCH 2/2 fixes some build issues, it is also a pretty
 > radical change and I'm not sure it's a good idea to apply to master so
 > late in the dev cycle.

I know, but what is the alternative? Tell people to not use the toplevel
parallel build feature? That also isn't really great.

-- 
Bye, Peter Korsgaard
