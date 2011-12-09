From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 09 Dec 2011 09:18:29 -0300
Subject: [Buildroot] [PATCH 1/2] ipset: bump to version 6.10
In-Reply-To: <87k466b0ce.fsf@macbook.be.48ers.dk>
References: <1322858749-16654-1-git-send-email-gustavo@zacarias.com.ar>
 <87k466b0ce.fsf@macbook.be.48ers.dk>
Message-ID: <deb42b6dfa18add6fe71aa42154b8fb6@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09.12.2011 05:44, Peter Korsgaard wrote:

>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>  Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>  Gustavo> ---
>  Gustavo>  package/ipset/ipset-drop-modules.patch |  100
> --------------------------------
>
> Why did you drop this patch? The build fails here as it ends up 
> looking
> at my host modules:
>
> configure: error: Invalid kernel source directory 
> /lib/modules/3.1.1/source
> make: ***
> 
> [/home/peko/source/buildroot/output/build/ipset-6.10/.stamp_configured]
> Error 1

On my tests it works autodetecting that it doesn't need to, it's new to 
version 6.10.
Try the v2 patch which forces it to no, something different in your 
config and/or host probably triggers the autodetection to think it does.
Regards.
