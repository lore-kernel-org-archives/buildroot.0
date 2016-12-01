From: Damjan Marion <damjan.marion@gmail.com>
Date: Thu, 1 Dec 2016 10:04:00 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: change configuration
 directory
In-Reply-To: <20161201091948.1842ae49@free-electrons.com>
References: <20161128094512.27804-1-damjan.marion@gmail.com>
 <20161130221053.GA3619@free.fr> <20161130232712.636daccd@free-electrons.com>
 <62DF7C96-6583-43AE-9AD5-A13DD4A0B49E@gmail.com>
 <20161130234617.19db5f82@free-electrons.com>
 <4A1A37A4-9EA0-44A4-89BB-DE3C88C8CADE@gmail.com>
 <20161201091948.1842ae49@free-electrons.com>
Message-ID: <5E6E2C2A-9E8C-412C-AB9F-1EC02BA8B8F5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 1 Dec 2016, at 09:19, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Wed, 30 Nov 2016 23:52:06 +0100, Damjan Marion wrote:
> 
>>> Well a +1 here is not really useful. A patch or at least initial
>>> investigation of the feasibility would be a lot more useful :-)  
>> 
>> I can resubmit the patch if we all agree that /var is better place.
>> I just wanted to say that I agree with you...
> 
> Well, the problem is that your change would put both the configuration
> and state into /var. While the correct thing is to have the
> configuration in /etc and the state in /var.

tvheadend doesn?t have static configuration beside few command line parameters
which are already in /etc/default/tvheadend.
Everything else is in json encoded files and it is changed via web ui.
i.e. when you add new user via web ui, daemon will create new json file with all user parameters.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 1600 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161201/ce72ca5a/attachment.p7s>
