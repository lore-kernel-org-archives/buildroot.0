From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:47:49 +0100
Subject: [Buildroot] [PATCH 1/1] brotli: update to version 1.0.7
In-Reply-To: <874ld95464.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 26 Oct 2018 13:38:11 +0200")
References: <20181024233823.22831-1-aperez@igalia.com>
 <87h8h958ni.fsf@dell.be.48ers.dk> <20181026141425.GB4330@momiji>
 <874ld95464.fsf@dell.be.48ers.dk>
Message-ID: <87wopgy4q2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
 >> On Fri, 26 Oct 2018 12:01:21 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
 >>> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
 >>> 
 >>> > The new version, among other changes, includes important fixes
 >>> > for unaligned memory access on ARM (both for 32 and 64-bit), as well
 >>> > as performance improvements and build fixes.
 >>> 
 >>> Does this mean that we should backport this version bump to the current
 >>> LTS release (2018.02.x) as well then?

 >> This is probably a good idea. I was reluctant to suggest it from the get-go
 >> because there is no mention to security updates in the release notes, but
 >> the unaligned memory access will cause crashes, which on could argue can be
 >> exploited for DoS attacks ?. Also, it's a point release so the API/ABI of
 >> the library remains the same, and the risk of breaking things is minimal.

 >> So yes, I think it's a good idea to backport the update to the LTS version.

 > Ok, thanks - I'll cherry pick it next time I sync LTS with master.

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
