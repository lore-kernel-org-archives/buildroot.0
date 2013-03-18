From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 18 Mar 2013 21:10:27 +0000
Subject: [Buildroot] [PATCH] libcap: Add optional support for libattr
	capabilities
In-Reply-To: <87mwu0zc17.fsf@dell.be.48ers.dk>
References: <1363364558-5321-1-git-send-email-markos.chandras@gmail.com>
 <20130316191153.29c28d2b@skate>
 <CAG2jQ8gJzTXxWmr085JQAVmypJ4TSJWWQxfqj1SX72YqzjtONg@mail.gmail.com>
 <87mwu0zc17.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8hD6qiWqqnfVm=jmu6Kk_vvpRVjm=b+Sx_EgQ5FbMy5TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 March 2013 20:30, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
>  >>> +ifeq ($(BR2_PACKAGE_ATTR),y)
>  >>> +     LIBCAP_DEPENDENCIES += host-attr attr
>  >>
>  >> We don't generally tie dependencies of host packages on
>  >> BR2_PACKAGE_<foo> options. Is there a specific reason that requires
>  >> host-libcap to be built against host-attr?
>  >>
>  Markos> Hi Thomas,
>
>  Markos> No special reason, just making sure the host-libcap is built
>  Markos> the same way as the target one does so it can support the same
>  Markos> functionality.  Should I resend this patch but only changing
>  Markos> the way the target libcap is built?
>
> I would say so. We don't even currently have a host-attr package, so I'm
> not sure how it could work?
>
> --
> Bye, Peter Korsgaard

Hi Peter,

Ok I will submit a new patch changing only the target libcap to link
with libattr.

-- 
Regards,
Markos Chandras
