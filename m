From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 11:21:16 -0300
Subject: [Buildroot] [PATCH] stunnel: bump to version 5.16
In-Reply-To: <20150423145629.6a75c166@free-electrons.com>
References: <1429790551-7950-1-git-send-email-gustavo@zacarias.com.ar>
 <20150423145629.6a75c166@free-electrons.com>
Message-ID: <5538FFDC.1070206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/2015 09:56 AM, Thomas Petazzoni wrote:

>> +STUNNEL_CONF_ENV = ax_cv_check_cflags___fstack_protector=no
> 
> Shouldn't this be:
> 
> STUNNEL_CONF_ENV = \
> 	ax_cv_check_cflags___fstack_protector=$(if $(BR2_ENABLE_SSP),yes,no)
> 
>  ?

Oi, yes.
The problem is that the detection is too optimistic, it assumes it's ok
under most circumstances, and breaks in a non-trivial way.
Sent V2.
Regards.
