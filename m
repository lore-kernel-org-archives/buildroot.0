From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Apr 2018 00:55:43 +0200
Subject: [Buildroot] [PATCH 1/2] python-webpy: needs hashlib support in
 python
In-Reply-To: <20180404155132.17500-1-peter@korsgaard.com>
References: <20180404155132.17500-1-peter@korsgaard.com>
Message-ID: <9a7c746b-d237-7169-c121-f3091d152fbe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-04-18 17:51, Peter Korsgaard wrote:
> webpy uses hashlib for session handling, so ensure it is available:
> 
> web/session.py:    import hashlib
> web/session.py:    sha1 = hashlib.sha1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-webpy/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
> index 12dbe61723..5f4df7832b 100644
> --- a/package/python-webpy/Config.in
> +++ b/package/python-webpy/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_WEBPY
>  	bool "python-webpy"
>  	depends on BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_HASHLIB

 # runtime ?

 Regards,
 Arnout

>  	help
>  	  web.py is a web framework for Python that is as simple as it
>  	  is powerful.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
