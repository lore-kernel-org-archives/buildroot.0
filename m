From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 11 Jul 2018 19:06:13 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 2/2] coreutils: optimize the '[' symlink
In-Reply-To: <7ebb787a-3798-5534-9cef-2012943d50ad@mind.be>
References: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
 <5821c4c9a85e95a15423616c8a7f674df515b714.1531338679.git.baruch@tkos.co.il>
 <7ebb787a-3798-5534-9cef-2012943d50ad@mind.be>
Message-ID: <420364696.3228173.1531346773590.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Baruch Siach" <baruch@tkos.co.il>, "buildroot" <buildroot@busybox.net>
> Cc: "DATACOM" <casantos@datacom.com.br>
> Sent: Wednesday, July 11, 2018 6:49:43 PM
> Subject: Re: [PATCH v2 2/2] coreutils: optimize the '[' symlink

> On 11-07-18 21:51, Baruch Siach wrote:
>> Link '[' directly to the coreutils binary instead of going through
>> 'test'.
> 
> One more small question: did you do a runtime test to be sure that this
> actually works? (That said, if this doesn't work, then the previous one also
> can't have worked.)

Yes, but it must be invoked directly since '[' is a shell built-in
command:

   # type [
   [ is a shell builtin
   # /usr/bin/[ -d / ] && echo ok
   ok

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
