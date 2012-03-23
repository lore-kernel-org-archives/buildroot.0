From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Mar 2012 14:44:49 -0300
Subject: [Buildroot]
 =?utf-8?q?libupnp_version_1=2E6=2E14_Not_OK_=3A__http?=
 =?utf-8?q?d_=28busybox=29_http_header_not_accepted_by_libupnp_1=2E6=2E14_?=
 =?utf-8?q?=3F?=
In-Reply-To: <CE13F41522F543FF9EEA63F4B397A7BB@JohanW7>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
 <3A0E0C9320F449BC8EB3C0BC9A1CEF40@JohanW7>
 <6cbdb6e08635a9c3e9b273a7a95a2a56@zacarias.com.ar>
 <36443DEF86594D9B9A729F56B7FA7973@JohanW7>
 <0180fc4aa250d447b1da60b4cecb5d88@zacarias.com.ar>
 <CE13F41522F543FF9EEA63F4B397A7BB@JohanW7>
Message-ID: <bf7504c2ffea0a43d73d35c2278d74b9@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-23 14:33, Sagaert Johan wrote:

> Hi
>
> Gustavo
>
> I have sent them to you as attachements, did you get them ?
>
>
> I did some experiments, i moved the xml descriptor files to an
> external http server (microsoft iis )
> With the files served from IIS upnp1.6.14 seems to work, so this
> confirms that the http header sent by busybox is rejected by
> libupnp1.6.14
>
> Its clear that busybox does not add the correct content header when
> requesting an xml file from the server.
> Some network sniffing results :
>
> (Should this be forwarded to the busybox maintainers ? I don't like
> to subscribe to yet another list ...)

Hi Johan.
Didn't get much time to play with Debian's libupnp, the whole thing 
looks tangled, they seemed to have forked circa 1.6.6 and went their own 
way.
It seems that busybox httpd is returning the generic (octet-stream) 
mime type, did you try configuring .xml to report the correct type back?
In httpd.conf it should be:
.xml:application/xml

Regards.
