From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Jan 2013 18:35:54 -0300
Subject: [Buildroot] need help adding apache to buildroot
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
Message-ID: <50F71D3A.2010906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/16/2013 06:30 PM, Jenkins, Lee (ISS Houston) wrote:

> Hello. I?m adding apache httpd to my buildroot project but I?m stuck and
> need some help.
> 
> Here?s what I?ve done so far:
> 
> 7.       ran ?make apache-source? as a test, but make replies: ?No rule
> to make target `apache-source?. Stop.?
> 
>  
> 
> I expected make to pick up the new package, but that?s clearly not
> happening. What am I missing?
> 
> $(eval $(call AUTOTARGETS))

If you're using latest git buildroot this has changed to:

$(eval $(autotools-package))

So the package infrastructure isn't evaluating (parsing) your package at
all.
Regards.
