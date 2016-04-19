From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Apr 2016 11:34:19 -0300
Subject: [Buildroot] [PATCH 1/2] linux-firmware: drop revision handling
 for iwlwifi
In-Reply-To: <20160417223047.5b2b76fa@free-electrons.com>
References: <1460743888-19967-1-git-send-email-gustavo@zacarias.com.ar>
 <20160417223047.5b2b76fa@free-electrons.com>
Message-ID: <571641EB.6030305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/16 17:30, Thomas Petazzoni wrote:

> It would be nicer if we could find a way of using wildcards here, as it
> would make it more future proof (i.e it would automatically handle new
> firmware revisions).
>
> Could you have a look and see if it's doable?

Hi.
Switching the "tar -C $(@D) ..." to "cd $(@D); tar ... " in 
LINUX_FIRMWARE_INSTALL_FILES makes it doable.
I'll send a new series shortly.
Regards.
