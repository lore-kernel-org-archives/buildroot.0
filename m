From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 13:49:17 +0200
Subject: [Buildroot] [PATCH 04/14 v4] package/skeleton: split out into
 skeleton-custom
In-Reply-To: <65699c6d-b520-b932-45dc-bf9e98bede7b@mind.be>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
 <af2a3c603d857f4012889fb60931a514bdbd93a8.1501017251.git.yann.morin.1998@free.fr>
 <65699c6d-b520-b932-45dc-bf9e98bede7b@mind.be>
Message-ID: <e095a88e-5e31-29d3-54de-4102990304e7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-17 02:16, Arnout Vandecappelle wrote:
>  I've fixed all that and was going to apply, but then I noticed that patch 1
> breaks our tests, so I refrained from pushing it. You can fetch it from
> https://gitlab.com/arnout/buildroot (master branch; will be rebased away in a
> couple of days).

 So I pushed this commit with the runtime testing patch 11 on top of to gitlab
to see what would happen, and the systemd test fails. It seems the getty on
ttyAMA0 can't be started. Is that to be expected, due to the /var/log->/tmp symlink?

 You can inspect the output on [1], but it's not saying much.

 Regards,
 Arnout

[1]
https://gitlab.com/arnout/buildroot/-/jobs/24489865/artifacts/raw/test-output/TestInitSystemSystemdRwFull-run.log

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
