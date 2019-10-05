From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:42:47 +0200
Subject: [Buildroot] [PATCH] package/ruby: security bump to version 2.4.9
In-Reply-To: <20191005072727.25130-1-peter@korsgaard.com>
References: <20191005072727.25130-1-peter@korsgaard.com>
Message-ID: <d886e983-1408-2049-9be9-e57f55dd4556@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/10/2019 09:27, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> (Bundled jquery)
> - CVE-2012-6708: jQuery before 1.9.0 is vulnerable to Cross-site Scripting
>   (XSS) attacks.  The jQuery(strInput) function does not differentiate
>   selectors from HTML in a reliable fashion.  In vulnerable versions, jQuery
>   determined whether the input was HTML by looking for the '<' character
>   anywhere in the string, giving attackers more flexibility when attempting
>   to construct a malicious payload.  In fixed versions, jQuery only deems
>   the input to be HTML if it explicitly starts with the '<' character,
>   limiting exploitability only to attackers who can control the beginning of
>   a string, which is far less common.
> 
> - CVE-2015-9251: jQuery before 3.0.0 is vulnerable to Cross-site Scripting
>   (XSS) attacks when a cross-domain Ajax request is performed without the
>   dataType option, causing text/javascript responses to be executed.
> 
> https://www.ruby-lang.org/en/news/2019/08/28/multiple-jquery-vulnerabilities-in-rdoc/
> 
> - CVE-2019-16255: A code injection vulnerability of Shell#[] and Shell#test
> 
> https://www.ruby-lang.org/en/news/2019/10/01/code-injection-shell-test-cve-2019-16255/
> 
> - CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)
> 
> https://www.ruby-lang.org/en/news/2019/10/01/http-response-splitting-in-webrick-cve-2019-16254/
> 
> - CVE-2019-15845: A NUL injection vulnerability of File.fnmatch and File.fnmatch?
> 
> https://www.ruby-lang.org/en/news/2019/10/01/nul-injection-file-fnmatch-cve-2019-15845/
> 
> - CVE-2019-16201: Regular Expression Denial of Service vulnerability of
>   WEBrick's Digest access authentication
> 
> https://www.ruby-lang.org/en/news/2019/10/01/webrick-regexp-digestauth-dos-cve-2019-16201/
> 
> 2.4.9 fixes a packaging bug in 2.4.8:
> 
> https://www.ruby-lang.org/en/news/2019/10/02/ruby-2-4-9-released/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout
