From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 13:35:11 +0100
Subject: [Buildroot] [PATCH v2 11/15] python2: generate reproducible .pyc
In-Reply-To: <b6bad468-9690-bf8d-1d7e-d3913f85cb91@mind.be>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-12-git-send-email-jezz@sysmic.org>
 <b6bad468-9690-bf8d-1d7e-d3913f85cb91@mind.be>
Message-ID: <cfab8d02-dbd2-182c-c374-693b83986f80@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 11:41, Arnout Vandecappelle wrote:
> 
> On 18-11-16 10:10, J?r?me Pouiller wrote:
>> > .pyc files contain modification time of .py source. In order to make
>> > build reproducible, we fix modification time of all .py before to
>> > compile .pyc files.
>  I wonder if it is worth doing this globally.
> 
>  Normally, the .py file will come out of a tarball, so it's modification time is
> fixed.
> 
>  So this is only about generated .py files. How often does that happen? Isn't it
> better to deal with that per package?

 Forget what I said, python's own install doesn't seem to retain timestamps, so
there are a lot of py files with build-dependent timestamps. So this patch is
certainly needed.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
