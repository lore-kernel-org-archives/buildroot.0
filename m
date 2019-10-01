From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Oct 2019 10:35:18 +0200
Subject: [Buildroot] [PATCH 10/10] package/mdevd: bump version to 0.1.1.0
In-Reply-To: <20191001085020.43b52a31@windsurf.home>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
 <20190929171017.26831-11-eric.le.bihan.dev@free.fr>
 <20190930225757.44578f50@windsurf.home> <87wodp1npl.fsf@dell.be.48ers.dk>
 <20190930231441.GB11114@itchy> <20191001085020.43b52a31@windsurf.home>
Message-ID: <e5b70991-b0ca-79f1-33a0-1eb00bf6aa88@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/10/2019 08:50, Thomas Petazzoni wrote:
> On Tue, 1 Oct 2019 01:14:41 +0200
> Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> 
>> I did not know about the daemon mode of mdev, but mdevd was created to
>> overcome the mdev forking issue [1] and predates the daemon option [2].
>>
>> So in the end, they provide the same features, with mdevd also complying
>> with s6 notification mechanism [3], making it more tightly coupled with
>> this init system.
>>
>> Given that there is no option in menuconfig to use a s6-based init
>> system [4], I see no reason to add a "devtmpfs+mdevd" option ATM.
> 
> But then there is nothing that prevents them from enabling
> devtmpfs+eudev as the /dev management system, and separately enable
> mdevd. That wouldn't work very well.
> 
> On the other hand, if a user enables both openssh and dropbear, in
> their default configuration, both will try to listen on TCP port 22,
> which won't work as well. So perhaps we can live with having mdevd as a
> standalone package, with no specific handling in the /dev management
> choice. I'm just a bit worried about users who will enable this mdevd
> package, while they are looking for Busybox mdev.

 AFAIU, the s6 tools are really an ecosystem. So I think it would make sense to
move all of them into a "s6 system management" menu under System tools. That
should make it sufficiently clear that this is not related to busybox mdev.


 Regards,
 Arnout
