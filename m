From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Aug 2015 15:04:12 +0100
Subject: [Buildroot] [RFC PATCH] pkg-generic: detect incorrectly used
 package
In-Reply-To: <55E06603.2090100@imgtec.com>
References: <1440768358-31040-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55E06603.2090100@imgtec.com>
Message-ID: <55E06A5C.4020409@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,


since there are certain packages which don't start by BR2_PACKAGE_ (i.e.
BR2_TOOLCHAIN_EXTERNAL), I would suggest you to make this change:

On 08/28/2015 02:45 PM, Vicente Olivert Riera wrote:
>> +	$(Q)if test "$(TYPE)" = "target" -a -z "$(BR2_PACKAGE_$(PKG))" ; then \

to:

+       $(Q)if test "$(TYPE)" = "target" -a -z "$(BR2_PACKAGE_$(PKG))" \
+                                        -a -z "$(BR2_$(PKG))" ; then \

Regards,

Vincent.
