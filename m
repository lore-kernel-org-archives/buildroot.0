From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Thu, 02 Jul 2015 11:01:58 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <2854682.pCSB3Zb5Zv@sagittea>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <20150616215022.6eb61f22@free-electrons.com>
 <5587E032.8030506@syscom-instruments.com> <2854682.pCSB3Zb5Zv@sagittea>
Message-ID: <5594FE06.5030900@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/23/2015 09:56 AM, J?r?me Pouiller wrote:
> Does this process would work?
>
>    rm build/*/.stamp_built
>    make
>
>

Hi J?rome,

Yes. It can be a solution. I already did this way to rebuild package in 
the old time when there wasn't the *-rebuild target command:

rm -rf output/build/clearsilver-0.10.5/.stamp_built && rm -rf 
output/build/clearsilver-0.10.5/.stamp_configured

But I prefer an integrated mechanism in the makefile which make the 
think more reliable and transparent :)

Regards,
Anthony.
