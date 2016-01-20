From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 10:40:58 -0300
Subject: [Buildroot] Browser in kiosk mode
In-Reply-To: <569F8C67.3010709@gmail.com>
References: <569F7F6A.4060906@gmail.com> <569F8B19.5010304@zacarias.com.ar>
 <569F8C67.3010709@gmail.com>
Message-ID: <569F8E6A.7000703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/01/16 10:32, Marco Trapanese wrote:

> About the features, I think it should run javascripts and flash contents
> because most websites use them. Of course, because the whitelist, we
> will allow only trusted websites.
>
> How do you think to avoid the user to change options?

Hi.
For flash you'll need to run in some x86 platform since it requires the 
propietary binary flash plugin (there's gnash but it never went far 
enough i believe). You'll also need X11 for it i think, and some 
nsplugin-aware browser.
Well, squid in transparent proxy mode intercepts all http traffic so 
there's no other way out if you lock down networking additionally via 
iptables to avoid accessing some external proxy - browser settings won't 
matter since the list is handled by squid itself in it's config file or 
external acl file, or some other way via a helper program like squidguard.
See: http://www.webdnstools.com/articles/squid-proxy-whitelist
Regards.
