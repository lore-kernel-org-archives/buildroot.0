From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 05 Sep 2016 10:20:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-02
In-Reply-To: <87vayau5yt.fsf@dell.be.48ers.dk>
References: <20160903063033.788551028C6@stock.ovh.net>
 <20160903232302.40ff0733@free-electrons.com>
 <87vayau5yt.fsf@dell.be.48ers.dk>
Message-ID: <2417272.QXHhLvSnBg@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 September 2016 10:05:30 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-
electrons.com> writes:
> Hi,
> 
>  >> > However, we could discuss whether it really makes sense to use
>  >> > https:// as the main download location when all downloads anyway
>  >> > fall
>  >> > back to downloading from sources.buildroot.net over http://.
[...]
> - Do nothing. The issue is not so big, and presumably will get smaller
> over time as older distributions get updated.
> 
> - Change HTTPS URLs to HTTP where possible. Notice that these days a
>   number of websites use HSTS headers to enforce HTTPS. I'm not sure
>   when HSTS support got added to wget though (not clear from
> changelog)
> 
> - Pass --no-check-certificate in BR2_WGET to disable the check,
> working around the issues.
> 
> What do you say?

wget exit with error code '5' if it detect an SSL verification failure. 
Buildroot may detect it and display a message explaining how to work 
around the problem (something like "Try with BR2_WGET='wget --no-check-
certificate'").


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
