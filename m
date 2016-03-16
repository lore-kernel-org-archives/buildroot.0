From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Mar 2016 16:09:52 -0300
Subject: [Buildroot] [PATCH] openpgm: depends on sync2/sync4
In-Reply-To: <20160316165310.1b536bc3@free-electrons.com>
References: <1458138013-18031-1-git-send-email-gustavo@zacarias.com.ar>
 <20160316165310.1b536bc3@free-electrons.com>
Message-ID: <56E9AF80.60001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/03/16 12:53, Thomas Petazzoni wrote:

> Maybe we can remove this dependency then?
>
> Blackfin provides __sync_*() for 4-bytes, but not for 2 bytes.
>
> And indeed, the original commit that added this dependency points to
> http://autobuild.buildroot.org/results/3bd/3bda860a269dd9a4e38533cc9350892c68102618/build-end.log,
> which shows undefined reference for the two bytes variants.
>
> Could you submit an updated patch that removes the Blackfin dependency?
>
> Thanks!
>
> Thomas

Indeed, the comment in Config.in wasn't clear which gcc instrinsics it 
used. I'll spin v2.
Regards.
