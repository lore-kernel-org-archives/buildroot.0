From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Feb 2012 23:10:03 +0100
Subject: [Buildroot] [PATCH 1/2] poco: the Zip module depends on XML,
	Net and Util modules
In-Reply-To: <3b38408088d90bd4c521eb6f35d73502c1d5f352.1328221763.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328221763.git.thomas.petazzoni@free-electrons.com>
 <3b38408088d90bd4c521eb6f35d73502c1d5f352.1328221763.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201202062310.04009.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 02 February 2012 23:29:25 Thomas Petazzoni wrote:
> Without this, in a configuration where the Zip module is selected but
> not the XML module, the build fails due to missing expat.h. This is
> because POCO builds the XML module as soon as the Zip module is
> enabled.
> 
> This fixes the build breakage visible at:
> 
>   http://free-electrons.com/~thomas/buildroot/test-output-2011-12-02/test-920-output.bz2
> 
> with the configuration visible at:
> 
>   http://free-electrons.com/~thomas/buildroot/test-output-2011-12-02/test-920-config

 Good idea to refer to the test.  However, will it exist there forever?  
If not, I'm not sure if it should be in the commit message.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/poco/Config.in |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index 241e304..36d8de9 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -37,6 +37,9 @@ config BR2_PACKAGE_POCO_NETSSL_OPENSSL
>  
>  config BR2_PACKAGE_POCO_ZIP
>  	bool "zip"
> +	select BR2_PACKAGE_POCO_XML
> +	select BR2_PACKAGE_POCO_NET
> +	select BR2_PACKAGE_POCO_UTIL
>  
>  config BR2_PACKAGE_POCO_DATA
>  	bool
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
