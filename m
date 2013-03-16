From: Markos Chandras <markos.chandras@gmail.com>
Date: Sat, 16 Mar 2013 19:52:45 +0000
Subject: [Buildroot] [PATCH] libcap: Add optional support for libattr
	capabilities
In-Reply-To: <20130316191153.29c28d2b@skate>
References: <1363364558-5321-1-git-send-email-markos.chandras@gmail.com>
 <20130316191153.29c28d2b@skate>
Message-ID: <CAG2jQ8gJzTXxWmr085JQAVmypJ4TSJWWQxfqj1SX72YqzjtONg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 March 2013 18:11, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Fri, 15 Mar 2013 16:22:38 +0000, Markos Chandras wrote:
>
>> +ifeq ($(BR2_PACKAGE_ATTR),y)
>> +     LIBCAP_DEPENDENCIES += host-attr attr
>
> We don't generally tie dependencies of host packages on
> BR2_PACKAGE_<foo> options. Is there a specific reason that requires
> host-libcap to be built against host-attr?
>
Hi Thomas,

No special reason, just making sure the host-libcap is built the same
way as the target one does so it can support the same functionality.
Should I resend this patch but only changing the way the target libcap is built?

-- 
Regards,
Markos Chandras
