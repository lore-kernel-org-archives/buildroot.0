From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Feb 2013 10:50:56 -0300
Subject: [Buildroot] [PATCH 2/2] libcurl: packages that use it need mmu
 also
In-Reply-To: <20130214144713.632dcc63@skate>
References: <1360846981-26122-1-git-send-email-gustavo@zacarias.com.ar>
 <1360846981-26122-2-git-send-email-gustavo@zacarias.com.ar>
 <20130214144713.632dcc63@skate>
Message-ID: <511CEBC0.60009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/14/2013 10:47 AM, Thomas Petazzoni wrote:
> I don't agree. I believe the libcurl package should not depend on
> BR2_USE_MMU instead. I have a patch that I'll send as a reply to this
> e-mail.

Cool, i don't have much time to look into it so i went the fast route.
Careful though, 7.28.1 is security vulnerable and a bump to 7.29.0 is
necessary.
That said the bump doesn't build since it doesn't like macro definitions
in CFLAGS, it's probably safer to just patch the security vulnerability
since moving over the largefile defs to CPPFLAGS isn't probably clean at
this point in the upcoming release.
Regards.
