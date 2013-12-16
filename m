From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Dec 2013 15:46:25 +0000
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
In-Reply-To: <87bo0gsu9g.fsf@dell.be.48ers.dk>
References: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
 <871u1i2lhm.fsf@dell.be.48ers.dk> <52AA38BC.2020407@mind.be>
 <87bo0l1y5p.fsf@dell.be.48ers.dk> <52AAD485.5040306@imgtec.com>
 <87haadyswh.fsf@dell.be.48ers.dk> <52AF10A4.6050609@imgtec.com>
 <87bo0gsu9g.fsf@dell.be.48ers.dk>
Message-ID: <52AF2051.7080806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/16/2013 03:14 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
> Hi,
>
>   >> > Yes, I sent a pull request upstream and they merged it. If you have
>   >> > updated the knock.mk to use the latest git, then we don't need any
>   >> > patch because it's already applied upstream :-)
>   >>
>   >> True, but the same applies with the current version we're using as that
>   >> is from before the README -> README.md rename.
>
>   > Oh, I understand now... You changed the git version of this package to
>   > downgrade it just to the point before the README -> README.md was
>   > made.
>
> Well, that's one way of seeing it - I fixed it to use the version
> specified (7666f2e86e18d4), which was presumably what was the submitter
> had desired. Before that fix it used the current head (first time the
> package was built, afterwards the local tarball in dl/ is used).
>
>
>   >> If you have tested the latest git then you are welcome to send a patch
>   >> bumping the version.
>
>   > Yes, I have tested it, but it's easier for you to just change the
>   > version to the last git commit number.
>
> Do you mind sending a patch changing KNOCK_VERSION so you can sign off
> on it? Thanks.
>

But you need to mirror it first. The version we have right know works 
because you have this tarball in the buildroot mirrors:
http://sources.buildroot.net//knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz

If you try to get that file from git, it fails with:
 >>> knock 7666f2e86e18d482eaad5fe1fea46d87d80b0555 Downloading
--2013-12-16 15:40:52-- 
https://github.com/jvinet/7666f2e86e18d482eaad5fe1fea46d87d80b0555/tarball/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz
Resolving github.com... 192.30.252.130
Connecting to github.com|192.30.252.130|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-12-16 15:40:53 ERROR 404: Not Found.

So, in order to bump the version you need to put the new tarball in the 
mirrors first.

-- 
Vincent
