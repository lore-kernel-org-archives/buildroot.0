From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 2 Dec 2020 17:57:31 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <CAMRc=MetvQ8Wx6GGD9MW_=Kt_xX+D2f=q1=+R7HdesmnR5OQOg@mail.gmail.com>
References: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
 <57-5f9bc680-3-4a87f08@125885651> <20201030091929.18f77130@windsurf.home>
 <CAMRc=MexG_jDoNuuVzRmNqHD56yYJmwzq43JgGo38equmPiqzQ@mail.gmail.com>
 <20201030101559.0a1fb98c@windsurf.home>
 <CAMRc=MfwZVv10O2DsQitxDsXdpXRSC29VpvqTkC81CkOBUFoLQ@mail.gmail.com>
 <20201030103450.57c772b3@windsurf.home>
 <CAMRc=Mfmk7Bb+eEJ8ikeBfMRir0eBAj7z53eqDK=f-XJqEN5Cg@mail.gmail.com>
 <20201030114153.4e47cdf8@windsurf.home>
 <CAMRc=MdXOK1qScv+b3vr-b9gr9Nwb0Yv=CqdtiCNF6UMM2niMg@mail.gmail.com>
 <854f8b3d-20bd-769a-ee3d-3639529a5fc0@mind.be>
 <CAMRc=Mfu40GYakBHNU_jyAjFLhFhb7r63tVoTY2QZVuikHXP-A@mail.gmail.com>
 <CAMRc=MetvQ8Wx6GGD9MW_=Kt_xX+D2f=q1=+R7HdesmnR5OQOg@mail.gmail.com>
Message-ID: <7d32b298-f286-da0e-a7a8-3e7481363aeb@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/2020 21:31, Bartosz Golaszewski wrote:
> Thomas,
> 
> I made a new release that redefines needed symbols if building on
> linux pre v5.5. I'm wondering though: what is the correct approach for
> C libraries if certain kernel uAPI symbols are missing? Redefine them
> or just live with ifdefs in the code?

Include a copy of the latest uapi headers that you use directly in your 
source tree.

At least, this is what libnl, iproute2, iw, hostapd and wpa_supplicant do.
