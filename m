From: Brad House <brad@mainstreetsoftworks.com>
Date: Sat, 11 Aug 2007 09:22:43 -0400
Subject: [Buildroot] [patch] openssl-0.9.7l (security)
In-Reply-To: <46B632FD.60607@mainstreetsoftworks.com>
References: <46B632FD.60607@mainstreetsoftworks.com>
Message-ID: <46BDB823.7000207@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any word on getting this committed?
Thanks.
-Brad

Brad House wrote:
> 0.9.7e has a few advisories against it.
> Here's a patch to bring it up to a more 'secure' version,
> should maintain binary compatibility as well.
> 
> I've also switched the option 'no-threads' to 'threads'.  It
> doesn't actually add any link dependencies to openssl,
> it simply enables some callbacks where a programmer can
> 'register' thread-safe callbacks for mutexes, etc.  If the
> programmer doesn't implement them, the library behaves the
> same as a no-threads build, so there is no impact here.
> Programs which use threads and OpenSSL _will_ crash randomly
> if openssl is not compiled with thread support.
> 
> Please apply the attached patch, and also remove the
> openssl-0.9.7e-no-fips.patch
> 
> -Brad
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
