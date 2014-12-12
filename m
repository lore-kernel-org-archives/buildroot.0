From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 15:28:24 +0000
Subject: [Buildroot] [PATCH v2] gnupg2: fix linking with intl
In-Reply-To: <20141211195331.48f6f7c4@free-electrons.com>
References: <1418299611-50833-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141211195331.48f6f7c4@free-electrons.com>
Message-ID: <548B0998.5000001@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/2014 06:53 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Thu, 11 Dec 2014 12:06:51 +0000, Vicente Olivert Riera wrote:
> 
>> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
>> +GNUPG2_DEPENDENCIES += gettext
>> +GNUPG2_CONF_ENV += LIBS=-lintl
> 
> Are you sure we need this LIBS part when glibc is used?

Uhm..., something must have changed in the tree and right now I'm not
able to reproduce this failure even using the same config file :/

http://autobuild.buildroot.net/results/9aa/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/config

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
