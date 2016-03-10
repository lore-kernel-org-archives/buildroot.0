From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 17:03:21 -0300
Subject: [Buildroot] [PATCH] busybox: use md5 as default password
	algorithm
In-Reply-To: <871t7im7ah.fsf@dell.be.48ers.dk>
References: <1457638990-27544-1-git-send-email-gustavo@zacarias.com.ar>
 <871t7im7ah.fsf@dell.be.48ers.dk>
Message-ID: <56E1D309.3030602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/16 17:01, Peter Korsgaard wrote:

> So this is what is used when you change password through the busybox
> passwd applet or create a new user, right?
>
> Shouldn't we instead tweak this based on BR2_TARGET_GENERIC_PASSWD_*?

Yes.
This is the lowest-common which is guaranteed to work on all scenarios, 
once we decide/switch to sha256 as default we can update it here, but i 
wouldn't defer this until then.
Regards.
