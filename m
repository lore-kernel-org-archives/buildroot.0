From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 08:04:16 +0200
Subject: [Buildroot] [PATCH] postgresql: new package
In-Reply-To: <20140403223952.37034a1a@skate>
References: <1396249169-14126-1-git-send-email-ps.report@gmx.net>
 <20140403223952.37034a1a@skate>
Message-ID: <533E4B60.8090804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/14 22:39, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Mon, 31 Mar 2014 08:59:29 +0200, Peter Seiderer wrote:
> 

[snip[

>> +if [ ! -f /srv/pgsql/data/PG_VERSION ]; then
> 
> I thought we changed to /var/lib/pgsql ?
> 
> Maybe you should create a variable that contains /var/lib/pgsql to
> avoid this duplication.

 I'm opposed to such variables, I don't see how they give an advantage:

- they make the code less readable (you have to look up what
POSTGRESQL_DATABASE_PATH expands to);

- they make the code longer (extra line for the assignment, and
POSTGRESQL_DATABASE_PATH is not significantly shorter than /var/lib/pgsql);

- changing the path is quite trivial as long as it stays in the same file
(I admit that I assume that you vi-users know how to escape a /).


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
