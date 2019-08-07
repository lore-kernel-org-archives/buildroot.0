From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Aug 2019 09:18:25 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
In-Reply-To: <20190723144459.5bfcc0fd@windsurf> (Thomas Petazzoni's message of
 "Tue, 23 Jul 2019 14:44:59 +0200")
References: <20190723123355.22313-1-vadim4j@gmail.com>
 <20190723144459.5bfcc0fd@windsurf>
Message-ID: <87sgqdmoji.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 23 Jul 2019 15:33:55 +0300
 > Vadim Kochan <vadim4j@gmail.com> wrote:

 >> provide info if the package will be installed to staging/target
 >> destinations. Might be useful for analyzing the packages which
 >> installed only for target/staging.
 >> 
 >> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 >> ---
 >> package/pkg-utils.mk | 8 ++++++++
 >> 1 file changed, 8 insertions(+)
 >> 
 >> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
 >> index b7280e930f..81222565bf 100644
 >> --- a/package/pkg-utils.mk
 >> +++ b/package/pkg-utils.mk
 >> @@ -94,6 +94,14 @@ endef
 >> define _json-info-pkg-details
 >> "version": "$($(1)_DL_VERSION)",
 >> "licenses": "$($(1)_LICENSE)",
 >> +	$(if $($(1)_INSTALL_TARGET), \
 >> +		"install_target": true$(comma),
 >> +		"install_target": false$(comma)
 >> +	)
 >> +	$(if $($(1)_INSTALL_STAGING), \
 >> +		"install_staging": true$(comma),
 >> +		"install_staging": false$(comma)
 >> +	)

 > I would prefer install-target and install-staging for the JSON property
 > names, I prefer - over _.

Notice that some programming languages handle json like variables
(object.property.subproperty), and '-' is typically not allowed in
variable names.

-- 
Bye, Peter Korsgaard
