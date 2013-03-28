From: =?UTF-8?B?VGlsbWFuIEtlc2tpbsO2eg==?= <arved@arved.at>
Date: Thu, 28 Mar 2013 15:59:34 +0100
Subject: [Buildroot] [PATCH 4/4] Enable feature CONFIG_FEATURE_PIDFILE
 so that the syslog initscript actually works
In-Reply-To: <5153ED66.3090001@mind.be>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
 <1364222893-23858-4-git-send-email-arved@arved.at> <5153ED66.3090001@mind.be>
Message-ID: <51545AD6.5050307@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

* Arnout Vandecappelle [Thu, 28 Mar 2013 08:12:38 +0100]:
>> -# CONFIG_FEATURE_PIDFILE is not set
>> +CONFIG_FEATURE_PIDFILE=y
> 
>  Since we care very much about the size of busybox, could you evaluate
> what the size difference is before and after this change?  One smallish
> architecture (e.g. ARM) is enough.
> 
>  Could you also make this change to the other busybox versions as well?
> The different busybox configs should only differ because of features
> added/removed in that particular version.

On ARM the difference is 64 Bytes. (gcc 4.6.x)

If you don't want to enable this feature, another option would be to use
start-stop-daemon -p in the syslog init script.

What do you think?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130328/2b2c60b7/attachment.asc>
