From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 00:30:32 +0200
Subject: [Buildroot] [PATCH] polarssl: deprecate on security grounds
In-Reply-To: <a115faea-facf-516e-0569-4c9b86cd32ea@mind.be> (Arnout
 Vandecappelle's message of "Wed, 12 Oct 2016 23:28:50 +0200")
References: <1476120393-19918-1-git-send-email-gustavo@zacarias.com.ar>
 <20161011122247.2dea9911@free-electrons.com>
 <87insystb7.fsf@dell.be.48ers.dk>
 <a115faea-facf-516e-0569-4c9b86cd32ea@mind.be>
Message-ID: <878tttp5dj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > In fact, amusingly, with our process, "deprecating" a package means
 >> > that it blindly disappears for users.
 >> 
 >> Yeah, that isn't really good. Perhaps we need to add a 'select
 >> BR2_NEEDS_DEPRECATED' to everything depending on BR2_DEPRECATED and add
 >> some logic to warn if BR2_NEEDS_DEPRECATED && !BR2_DEPRECATED?

 >  That doesn't work. If you keep the dependency on BR2_DEPRECATED, then the
 > symbol won't be selectable without BR2_DEPRECATED so it will be silently removed
 > from .config. If you remove the dependency on BR2_DEPRECATED, then the package
 > stays user selectable. In that case, the BR2_DEPRECATED option becomes a bit
 > useless (it just hides the warning comment), and it's easy for users to
 > accidentally select a deprecated package.

Ahh yes, true.

 >  You can task me with deprecating BR2_DEPRECATED during the devel
 > days - mainly documentation updates.

Ok, sounds good to me!

-- 
Venlig hilsen,
Peter Korsgaard 
