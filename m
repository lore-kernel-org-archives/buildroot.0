From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 14:29:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/tini: compile executable static
In-Reply-To: <a0e108bd-7bed-b161-c921-caf601f8a06f@eu.citrix.com>
References: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
 <20191123211555.GZ32494@scaer>
 <f361f14c-3a77-d769-1b5c-9a1a5fd8f3b3@eu.citrix.com>
 <5e477792-65af-42f8-5302-55ac4df554f9@mind.be>
 <a0e108bd-7bed-b161-c921-caf601f8a06f@eu.citrix.com>
Message-ID: <1e85cb1a-e256-fc05-8ecc-42a1f159c2da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 14:14, Simon Rowe wrote:
> On 01/12/2019 14:41, Arnout Vandecappelle wrote:
> 
>> ? Could you check with BR2_SHARED_LIBS=y and the current patch if it's possible
>> to build tini for all cases? I.e., external toolchain, internal with musl,
>> glibc, uClibc. If not, then you can make it conditional on !shared like this:
>>
>> ????$(if $(BR2_SHARED_LIBS),,-static)
> 
> I've run the current patch with the following toolchains
> 
> * internal, only shared libraries, musl
> * internal, only shared libraries, uClibc
> * internal, only shared libraries, glibc
> * external, only shared libraries, musl
> 
> and tini is built correctly.

 Excellent!

 So the patch was OK, just the commit message should be updated.

> 
>> ? And of course, we still need an explanation why it is needed after all while
>> before we thought it wasn't.
> 
> Does this need an expansion of the commit message or something elsewhere?

 Commit message.

 Thanks!

 Regards,
 Arnout
