From: Dimitrios Siganos <dimitris@siganos.org>
Date: Fri, 08 Feb 2013 10:58:09 +0000
Subject: [Buildroot] crda and m2crypto
In-Reply-To: <5114D0A3.7000501@zacarias.com.ar>
References: <5114BF4B.7080007@siganos.org> <5114D0A3.7000501@zacarias.com.ar>
Message-ID: <5114DA41.2040601@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 10:17, Gustavo Zacarias wrote:
> On 02/08/2013 06:03 AM, Dimitrios Siganos wrote:
> 
>> Hi,
>>
>> I am integrating crda with buildroot and I have run into a problem that
>> I'd like some feedback on.
> 
> Any particular reason you don't want the static db integrated in the kernel?
> Basically copy db.txt from wireless-regdb to linux-*/net/wireless/db.txt
> and enable CONFIG_CFG80211_INTERNAL_REGDB=y.
> Bam! No need for CRDA and all that.
> Making a kernel extension for this should be relatively simple, or
> alternatively just provide a patch for the kernel you're using.
> Regards.
> 

Hi Gustavo,

There is no particular reason for going with crda other than it is the
recommended way. I am a consultant working a with a module provider who
provides modules to third parties. The third parties make the final call
on everything but we want to deliver the recommended setup by default.

For us, as a business, bypassing the HOST_DIR and forcing the user to
install python-m2crypto is an acceptable solution. This is a nice
example that shows why upstreaming is sometimes not a simple matter
because of differing priorities between upstream/downstream.

We would like to work closer with buildroot so I'll make an effort to
upstream these changes. I have had a look at m2crypto and it seems
simple enough to integrate with buildroot. However, m2crypto now needs
'swig'.

If I fail to integrate m2crypto and dependencies within a reasonable
amount of time, I will go to plan to B. There seems to exist an easy
alternative. The key files produced are not likely to change because
they are the C representation of the public key that guarantees the
authenticity of the data. So I could just add to them to the buildroot
package to remove the need to build them and hence not need m2crypto.
From Thomas' reply, it sounds like that would be an acceptable workaround.

But for now, I will attempt to bring in m2crypto and dependencies as a
learning exercise.

Regards,
Dimitris
