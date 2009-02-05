From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 6 Feb 2009 09:06:11 +1100
Subject: [Buildroot] Webserver
In-Reply-To: <4989C13E.5040603@ethertek.ca>
References: <4989C13E.5040603@ethertek.ca>
Message-ID: <20090205220610.GA9769@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 04, 2009 at 08:24:30AM -0800, Dan Pattison wrote:
> spawn-fcgi.c:(.text+0x340): undefined reference to `rpl_malloc'  
> collect2: ld returned 1 exit status                                       

[...]
> We can see the error: undefined reference to `rpl_malloc', but being new  
> to cross compiling, we do not know how to fix it.

I've got a similar problem with a local package here. I put the
following in xxx_CONF_OPT (xxx being the package prefix in the .mk):

xxx_CONF_OPT = ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes

> Also, when using the add_new_package.wizard, how do you know when to  
> select "Does autoreconf need to be run first?". It did not seem to  
> matter in the case of cross compiling Cherokee-0.98.1

It may still be needed on other architectures, but leave it off for now.

> Lastly, does anyone know of a different web server for Buildroot that  
> will make the most common web browsers (IE6, IE7, Firefox etc) pop up  
> the username/password box?

Almost any web server should support basic authentication?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
