From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 15:34:41 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <0cef4a73d23345bbaf2f88905d0ed82f@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <55EDFE3E.8030205@mind.be> <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
 <55EED4CA.3040304@mind.be> <0cef4a73d23345bbaf2f88905d0ed82f@openmailbox.org>
Message-ID: <55EEE3F1.3000508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 15:01, C?dric Marie wrote:
> Le 2015-09-08 14:30, Arnout Vandecappelle a ?crit :
>>>> 1. Remove KBUILD_VERBOSE and quiet (this one will be uncontroversial I think)
>>>> 2. Define VERBOSE based on V= passed on command line
>>>> 3. Use VERBOSE in autotools and cmake
>>>> 4. Update documentation.
> 
>>  No, since VERBOSE already exists, my proposed step 2 is useless.
> 
> OK. Please note that I will change it a little bit:
> - remove export VERBOSE
> - VERBOSE=1 if V=1, even if VERBOSE is already defined (i.e. remove "ifndef
> VERBOSE" test)
> - VERBOSE=0 if V=0
> - VERBOSE=(empty) otherwise to prevent this variable from being inherited from
> the shell.

 Good!

 Note in the commit log why it has to be that way (for cmake, I guess).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
