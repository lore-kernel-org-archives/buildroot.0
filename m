From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jul 2017 21:51:50 +0200
Subject: [Buildroot] [PATCH 6/7] Makefile: add check that
 $(HOST_DIR)/usr is not a directory
In-Reply-To: <20170710161238.GA3014@scaer>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-7-arnout@mind.be>
 <20170710180240.43215e1a@windsurf.lan> <20170710161238.GA3014@scaer>
Message-ID: <3a401955-07d9-054c-61a4-c91871ae1257@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-17 18:12, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-07-10 18:02 +0200, Thomas Petazzoni spake thusly:
[snip]
>> I also don't like very much adding such checks. In which situation can
>> our users fall into this problem?
> 
> I've explained it in details when you initially reported the issue of
> regenerating the toolchains:
> 
>     http://lists.busybox.net/pipermail/buildroot/2017-July/197456.html
> 
>> They have an existing Buildroot tree, they do "git pull" and do a
>> partial rebuild ?
> 
> No, that occurs when a user points HOST_DIR outside, like you do for the
> toolchains, and that host-dir already exists, and it already contains a
> usr/ directory.

 Actually, I realize now: when people do a git pull, we expect them to do "make
clean all" afterwards. And "make clean" will delete HOST_DIR - so no
HOST_DIR/usr will exist anymore.

 So the original report from Thomas only happened because Thomas didn't do a
"make clean" like he should have...

 Or am I missing something?


> My opinion is that we should not allow using HOST_DIR if it is not empty
> at all.

 Not sure what you mean with "using HOST_DIR". Do you mean "using a non-default
HOST_DIR"? Do you mean that we should force people to do "make clean all" *all
the time* when using a non-default HOST_DIR?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
