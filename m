From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 8 Jul 2016 12:13:48 +0200
Subject: [Buildroot] [PATCH v2] openblas: add an option to install tests
 on the target
In-Reply-To: <20160706215607.785816dd@free-electrons.com>
References: <1467717365-27849-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160706215607.785816dd@free-electrons.com>
Message-ID: <577F7CDC.20907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I will try it.

Regards,

Vincent.

On 06/07/16 21:56, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 5 Jul 2016 12:16:05 +0100, Vicente Olivert Riera wrote:
>
>> +ifeq ($(BR2_PACKAGE_OPENBLAS_INSTALL_TESTS),y)
>> +define OPENBLAS_INSTALL_TESTS
>> +	for i in test ctest utest; do \
>> +		mkdir -p $(TARGET_DIR)/usr/share/openblas/$$i && \
>> +		cd $(@D)/$$i && \
>> +		find . -type f -perm -a=x -exec $(INSTALL) -m 0755 {} $(TARGET_DIR)/usr/share/openblas/$$i/{} \; && \
>> +		find . -type f -name "?in*" -exec $(INSTALL) -m 0644 {} $(TARGET_DIR)/usr/share/openblas/$$i/{} \; && \
>> +		find . -type f -name "*.dat" -exec $(INSTALL) -m 0644 {} $(TARGET_DIR)/usr/share/openblas/$$i/{} \; ; \
>> +		done
>> +endef
>> +OPENBLAS_POST_INSTALL_TARGET_HOOKS += OPENBLAS_INSTALL_TESTS
>> +endif
>
> To be honest, I really dislike such complicated install procedures.
> Could you instead work with upstream to have them add an appropriate
> target that allows to install the test programs?
>
> Looking at the upstream Github repository, they look very active, so
> getting some feedback should be possible.
>
> Thanks,
>
> Thomas
>
