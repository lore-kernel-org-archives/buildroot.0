From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 01 Dec 2014 18:12:03 -0300
Subject: [Buildroot] [PATCH 1/2] skeleton: make /run a directory
In-Reply-To: <CAHXCMM+J7M99tGUykrxi8MrruVsb34qa3CjHMTsf9XpesHS5vw@mail.gmail.com>
References: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>
 <CAGrucu1AtrSqG8_9Z6J0u4dR-Des_9W4xHH-HwguLpoen3vY3A@mail.gmail.com>
 <CAHXCMM+J7M99tGUykrxi8MrruVsb34qa3CjHMTsf9XpesHS5vw@mail.gmail.com>
Message-ID: <547CD9A3.3080603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2014 06:01 PM, Samuel Martin wrote:

>> Shouldn't we link /var/lock to (../)run/lock then?
> 
> I think we shuould.

It's not a prerequisite for this patch to get applied.
And that would fail badly for the systemd scenario, you want to use
tmpfiles.d for that since /run will be empty and no inittab/script will
fill that up.
Regards.
