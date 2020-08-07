From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Fri, 7 Aug 2020 12:21:51 +0200
Subject: [Buildroot] Root password and ssh issues
In-Reply-To: <20200807115412.3b93cbc4@windsurf.home>
References: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
 <20200807115412.3b93cbc4@windsurf.home>
Message-ID: <d0f3148a-c8d3-e5cf-68ee-030699e7abec@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your quick reply!


> What is the state of /etc/shadow with the non-working SSH login, and
> then the state of /etc/shadow after resetting the password with passwd
> ? I think I remember some issues with the expiration date/time of the
> password, or something like that.


Here are the details

# ls -la /etc/shadow
-rw-------??? 1 1000???? 1000?????????? 190 Aug? 7? 2020 /etc/shadow

# cat /etc/shadow
root:$5$D1pz/P1l$JCZhyjzCCqmXbnPx7g/mBtNtSSKkMqgctsmV/zBmlR2:::::::
daemon:*:::::::
bin:*:::::::
sys:*:::::::
sync:*:::::::
mail:*:::::::
www-data:*:::::::
operator:*:::::::
nobody:*:::::::

# passwd
Changing password for root
New password:
Bad password: too short
Retype password:
passwd: password for root changed by root

# cat /etc/shadow
root:$1$SYGd3a37$u2RV/VOsLPqWznY4GR1jU.:13514::::::
daemon:*:::::::
bin:*:::::::
sys:*:::::::
sync:*:::::::
mail:*:::::::
www-data:*:::::::
operator:*:::::::
nobody:*:::::::

# ls -la /etc/shadow
-rw-------??? 1 1000???? 1000?????????? 174 Aug? 7? 2020 /etc/shadow

I set the password the "root" (both in "menuconfig" and then through the
"passwd" command). Only after this command can I login through ssh.

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
