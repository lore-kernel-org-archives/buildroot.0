From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Wed, 13 Mar 2013 19:12:17 +1100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
 <20130313083725.4605312e@skate>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A61@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 13 Mar 2013 at 18:37:25, Thomas Petazzoni wrote:

> Dear Przemyslaw Wrzos,
> 
> On Wed, 13 Mar 2013 14:14:17 +1100, Przemyslaw Wrzos wrote:
> 
>> I'm finding that when using Crosstool-NG, the toolchain often seems
to
>> rebuild unnecessarily.
> 
> Isn't this caused by the following dependency
> 
> $(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)
> 
> I don't think we should depend on the Buildroot configuration here. It
> tries to be too smart by triggering the rebuild of the toolchain
> whenever the Buildroot configuration has changed, but this isn't
> normally done in Buildroot, so I'd say this dependency on
> $(BUILDROOT_CONFIG) shouldn't be there. Cc'ing Yann on this one.
> 
> Best regards,
> 
> Thomas

Yes, removing that dependency should also resolve this issue.

Cheers,
Przemyslaw Wrzos
