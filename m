From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Feb 2016 22:47:16 +0100
Subject: [Buildroot] [PATCH] Don't build host-cmake if it is available
 on the build host
In-Reply-To: <56B35428.2070400@lucaceresoli.net>
References: <1454363063-21105-1-git-send-email-luca@lucaceresoli.net>
 <56B06C7F.3010201@mind.be> <56B0704C.4060400@lucaceresoli.net>
 <56B35428.2070400@lucaceresoli.net>
Message-ID: <56B51864.7080406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-02-16 14:37, Luca Ceresoli wrote:
> Hi Arnout,
> 
> Luca Ceresoli wrote:

>>>> +cmake=`which $candidate`
>>>
>>>   $candidate could be an absolute path, in which case which returns
>>> nothing.
> 
> Not sure I got what you mean, sorry. which + absolute path returns the
> absolute path itself, if it exists:
> 
> $ which cmake
> /usr/bin/cmake
> $ which /usr/bin/cmake
> /usr/bin/cmake
> $ which /not/quite/cmake
> $
> 
> And the which(1) manpage confirms this is correct.
> 


 Oops, my bad, I tested it with a file that wasn't executable...


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
